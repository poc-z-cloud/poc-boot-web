package poc.spring.boot;

import java.sql.SQLException;

import org.h2.tools.Server;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@SpringBootApplication
@Controller
@EnableAutoConfiguration
@ImportResource("classpath:spring-config.xml")
public class WebApplication {
	private final static Logger logger = LoggerFactory.getLogger(WebApplication.class);
	
    @RequestMapping("/")
    public String index() {
        return "redirect:/index.html";
    }
    
    public static void main(String[] args) throws Exception {
    	String h2BaseDir=null;
    	for (int i=0;i<args.length;i++){
    		if ("-h2BaseDir".equalsIgnoreCase(args[i])){
    			h2BaseDir=args[i+1];
    			break;
    		}
    	}
    	
    	logger.info("-h2BaseDir:" + h2BaseDir);
    	startH2Server(h2BaseDir);
        SpringApplication.run(WebApplication.class, args);
    }
    
    private static void startH2Server(String h2BaseDir) {
    	if (h2BaseDir==null){
    		h2BaseDir="P:/JavaEE/workspaces/greateq/poc-boot-web/h2/data";
    	}
    	String[] args={"-tcp","-tcpPort","9092", "-baseDir", h2BaseDir};
    	try{
            Server h2Server = Server.createTcpServer(args).start();
    	}catch (SQLException e) {
    		//devtool restart issue
    		e.printStackTrace();
        }
    }
}
