package fr.eni.encheres.servlet;

import java.io.IOException;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Formatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bll.EncheresManager;
import fr.eni.encheres.bll.UtilisateurManager;
import fr.eni.encheres.bo.ArticleVendu;
import fr.eni.encheres.bo.Enchere;
import fr.eni.encheres.bo.Utilisateur;

/**
 * Servlet implementation class ServletEncheres    
 */
@WebServlet("/ServletEncheres")
public class ServletEncheres extends HttpServlet {
	
	/**Ici il ne veut pas prendre de Int ni de DATE, seulement des String, à vérifier ! **/
	
	private static final long serialVersionUID = 1L;
	public static final String ENCHERES="/WEB-INF/encheres.jsp";
	
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher(ENCHERES).forward( request, response );
	}      

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	try {		
		String n_enchere= request.getParameter("no_enchere");
		int no_enchere= Integer.parseInt(n_enchere);
		Date dateEnchere = new SimpleDateFormat("dd-MM-yyyy").parse(getInitParameter("dateEnchere"));
		String montantEnchere = request.getParameter("montant_enchere");
		int montant_enchere  = Integer.parseInt(montantEnchere);
		int noArticle =  Integer.parseInt(request.getParameter("noArticle"));
		int noUtilisateur = Integer.parseInt(request.getParameter("noUtilisateur"));
		
		EncheresManager encheresManager = new EncheresManager();
		
		/**Probleme ici avec la conversion de la date (String to Date) ligne 48. Pour le moment on ne peut pas remplacer "date_enchere" par "date" 
		 * dans les param de la méthode "ajoutEnchere() ligne 65 **/
		

		Enchere enchere= encheresManager.ajoutEnchere(no_enchere, dateEnchere, montant_enchere, noArticle, noUtilisateur);
		enchere = encheresManager.retournerEnchere(no_enchere);
		HttpSession session = request.getSession();
		session.setAttribute("enchere", enchere);
		RequestDispatcher rd = null;
		rd.forward(request, response);
		
		} catch (ParseException | BusinessException e1) {
			e1.printStackTrace();
		}

}}
