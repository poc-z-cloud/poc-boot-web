package poc.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.Function;
import org.mozilla.javascript.NativeObject;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.commonjs.module.Require;
import org.mozilla.javascript.commonjs.module.RequireBuilder;
import org.mozilla.javascript.commonjs.module.provider.SoftCachingModuleScriptProvider;
import org.mozilla.javascript.commonjs.module.provider.UrlModuleSourceProvider;


/**
 * JSX converter servlet to convert JSX to javaScript
 */
public class JsxConverterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Log log = LogFactory.getLog(JsxConverterServlet.class);
       
	private Map<String, String> cachedJs = new ConcurrentHashMap<String, String>();
	private String babelJsUri;

    public JsxConverterServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.babelJsUri = config.getServletContext().getInitParameter("babelJsUri");
		
		if (this.babelJsUri==null){
			this.babelJsUri = "/js/vendor/babel.min.js";
		}

		
		if(log.isInfoEnabled()) {
			log.info("babelJsUri = " + babelJsUri);
		}
	}

    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String requestUri = request.getRequestURI();
    	
    	if(!cachedJs.containsKey(requestUri)) {    		
    		synchronized(this) {
    			if(!cachedJs.containsKey(requestUri)) {
	    			String contextPath = request.getContextPath();
	            	String resourceUri = requestUri.substring(contextPath.length()) ;
	            	
	            	if(log.isInfoEnabled()) {
	            		log.info("start - JSX --> JS : " + resourceUri);
	            	}
	            	
	            	String convertedJs = convertJsx(resourceUri);
	            	
	            	if(log.isInfoEnabled()) {
	            		log.info("end - JSX --> JS : " + resourceUri);
	            	}
	            	
	            	cachedJs.put(requestUri, convertedJs);
    			}
    		}    		
    	}
    	
    	output(response, cachedJs.get(requestUri));
    	
 
	}

    private void output(HttpServletResponse response, String jsContent) throws IOException {
    	response.setContentType("application/javascript");
    	PrintWriter writer = null;
    	
    	try {
    		writer = response.getWriter();
    		writer.write(jsContent);            
    	}finally {
    		if(writer!=null) {
    			writer.close();
    		}
    	}
    	
    }
    
    private String convertJsx(String resourceUri) throws IOException {
        Context ctx;
        Scriptable exports;
        
        Function transform;
        
    	ctx = Context.enter();
    	ctx.setOptimizationLevel(-1);
    	
    	RequireBuilder builder = new RequireBuilder();
	    builder.setSandboxed(false);
	    
	    URI uri;
		try {
			uri = this.getServletContext().getResource(this.babelJsUri).toURI();
			
		} catch (URISyntaxException e) {
			throw new RuntimeException("babelJsUri error - " + babelJsUri, e);
		}
	    List<URI> uris = new ArrayList<URI>();
	    uris.add(uri);
	    
	    builder.setModuleScriptProvider(new SoftCachingModuleScriptProvider(
	            new UrlModuleSourceProvider(uris, null)
	    ));
	    
	    
	    Scriptable scope = ctx.initStandardObjects();
	    Require require = builder.createRequire(ctx, scope);
	    
	    String jsName = this.babelJsUri.substring(this.babelJsUri.lastIndexOf("/") + 1);
	    exports = require.requireMain(ctx, jsName);
	    
	    transform = (Function) exports.get("transform", scope);
	    Context.enter();
        try {       	
        	String options = "{plugins:['transform-class-properties', 'transform-object-rest-spread', 'transform-flow-strip-types'],presets:['react', 'es2015']}";
        	Object jsxArgs = ctx.evaluateString(scope, "(function () { return " + options + "; })()", "opt", 1, null);
        	
        	String jsxContent = loadJsxContent(resourceUri);
        	 if(log.isDebugEnabled()) {
             	log.debug("JSX(" + resourceUri + ") - " + jsxContent);
        	 }
        	
            NativeObject result = (NativeObject) transform.call(ctx, scope, exports, new Object[]{jsxContent, jsxArgs});
            String javascript = result.get("code").toString();
            
            if(log.isDebugEnabled()) {
            	log.debug("JavaScript(" + resourceUri + ") - " + javascript);
            }
            
            return javascript;
        } finally {
            Context.exit();
        }	    
	    
    }
    
    private String loadJsxContent(String resourceUri) throws IOException {
    	
    	InputStream input = null;
    	
    	try {
    		
    		int index = resourceUri.lastIndexOf(".jsx");
    		String uri = resourceUri.substring(0,index) + ".js";
    		
	    	input = this.getServletContext().getResourceAsStream(uri);
	    	String jsx = IOUtils.toString(input);
	    	input.close();
	    	
	    	return jsx;
    	}finally {
    		if(null!=input) {
    			input.close();
    		}
    	}
    	
    }

}
