package com.mypet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mypet.vo.SessionVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	/**
	 * ��Ʈ�ѷ� ���� �� ȣ��Ǵ� �޼ҵ�
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
								throws Exception {
		
		//���� ���� ��������
		HttpSession session = request.getSession();
		SessionVO svo = new SessionVO();
		svo.setId((String)session.getAttribute("session_id"));
		
		//���� üũ �� --> �α��� ȭ�� �̵�
		if ( svo.getId() == null ) {
			response.sendRedirect("http://14.47.84.213:9000/mypet/join.do");
			return false;
		}
		
		return true;
	}
	

	
}
