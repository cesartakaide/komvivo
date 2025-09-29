package com.erpx.jms;

import org.apache.activemq.command.ActiveMQObjectMessage;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import com.dme.base.to.BaseSpringBean;

@Component
public class TestListenerBean extends BaseSpringBean{

    @JmsListener(destination = "myQueue") // Specify the queue name
    public void receiveMessage(Object message) {
    	if (message instanceof ActiveMQObjectMessage) {
    		log.info("recibiendo:" + message.getClass().getName());
    		log.info(message.toString());
    		ActiveMQObjectMessage amqobj = (ActiveMQObjectMessage)message;
    		try {
    			Object obj = amqobj.getObject();
    			log.info("OBJETO:"+ obj.getClass().getName() + ":" + obj.toString());
    		}catch(Exception ex) {
    			log.error("ERROR", ex);
    		}
    	}
    }
}
