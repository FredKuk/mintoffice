package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class CharacterEncodingFilter
 */
public class CharacterEncodingFilter implements Filter {
	private String encoding;	
    /**
     * Default constructor. 
     */
    public CharacterEncodingFilter() {
    	System.out.println("MintOffice:CharacterEncodingFilter()생성자호출됨");
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
    	System.out.println("MintOffice:CharacterEncodingFilter() Destroyed");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("CharacterEncodingFilter의 doFilter()호출됨");
		request.setCharacterEncoding(encoding);
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("CharacterEncodingFilter의 init()호출됨");
		encoding = fConfig.getInitParameter("encoding");
	}

}
