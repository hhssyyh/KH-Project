package com.pointhome.www.chat.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket

public class WebSocketConfig implements WebSocketConfigurer {
	
	@Autowired private WebSocketHandler handler;

    //.withSockJS() 추가
    //setAllowedOrigins("*")에서 *라는 와일드 카드를 사용하면
    //보안상의 문제로 전체를 허용하는 것보다 직접 하나씩 지정해주어야 한다고 한다.
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(handler, "/websocket/*")
		.setAllowedOrigins("*");
		
		 
		
	}

}