<%@page import="org.apache.catalina.User"%>
<%@page import="java.rmi.server.RemoteStub"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="fr.eni.encheres.bo.Utilisateur"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="test.css">
<!-- FEUILLE CSS DE TEST -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Ubuntu:regular,bold&subset=Latin">
<title>Accueil</title>

</head>
<body>
	<div>
		<ul>
			<li><a href="ServletEncheres">Enchères</a></li>
			<li><a href="ServletVendreArticle">Vendre un article</a></li>
			<li><a href="ServletConnexion">Se connecter</a></li>
			<li><a href="ServletSinscrire">S'inscrire</a></li>
			
		<c:if test="${!empty utilisateur.pseudo}">	<!-- Si utilisateur connecté, bouton "Se déconnecter" visible et actif -->
			<li><a href="ServletDeconnexion">Se déconnecter</a></li>
		</c:if>
			
		<!--<c:if test="${!empty sessionScope.sessionUtilisateur}"> 
		<p class="succes">Bonjour!! : ${sessionScope.sessionUtilisateur.pseudo}</p>   
		</c:if> 
			<li><a href="ServletMonProfil">Mon profil</a></li>
			<li><a href="ServletAccueil">Déconnexion</a></li>-->	
		</ul>
	</div>

	<br>

	<h1>ENI-Enchères</h1>

	<h2>Liste des enchères</h2>
	
	<br>
	
	<div th:if="${param.logout}" class="alert alert-success">Vous vous êtes déconnecté.</div>  <!-- Test pour afficher un message lors de la déconnexion -->
	
	<form>
		<div>
		<div class="wrapper3" style="float:left;">
			<label>Filtres :</label> 
			<br> 
			<input id="searchsize" type="text" placeholder="Search.."> 
			<br>
			<label>Catégories: </label> 
			
			<select id="categorie" name="categorie">
				<option value="0">categorie1</option>
				<option value="1">categorie2</option>
				<option value="2">categorie3</option>
			</select> 
			
			<span><input type="radio"  name="achats" />Achats</span>
			<span><input type="radio"  name="achats" />Ventes</span>

			<span class="checkbox"><input type="checkbox" id="checkbox"> Enchères ouvertes</span> 
			<span class="checkbox"><input type="checkbox" id="checkbox"> Mes Ventes en cours</span> 
			<span class="checkbox"><input type="checkbox" > Mes enchères en cours</span> 
			<span class="checkbox"><input type="checkbox" class="checkbox"> Ventes non débutées</span> 
			<span class="checkbox"><input type="checkbox" class="checkbox"> Mes enchères remportées</span> 
			<span class="checkbox"><input type="checkbox" class="checkbox"> Ventes terminées</span>
		</div>
	
    <div class="wrapper4" style="float:right;">  
			<label>Filtres : </label> <br> <input id="searchsize" type="text" placeholder="Search.."> <br>
			<label>Catégories: </label> <select id="categorie" name="categorie">

				<option value="0">categorie1</option>
				<option value="1">categorie2</option>
				<option value="2">categorie3</option>

			</select> <span><input type="radio"  name="achats" />Achats</span>
			<span><input type="radio"  name="achats" />Ventes</span>

			<span class="checkbox"><input type="checkbox" id="checkbox"> Enchères ouvertes</span> 
			<span class="checkbox"><input type="checkbox" id="checkbox"> Mes Ventes en cours</span> 
			<span class="checkbox"><input type="checkbox" > Mes enchères en cours</span> 
			<span class="checkbox"><input type="checkbox" class="checkbox"> Ventes non débutées</span> 
			<span class="checkbox"><input type="checkbox" class="checkbox"> Mes enchères remportées</span> 
			<span class="checkbox"><input type="checkbox" class="checkbox"> Ventes terminées</span>

		</div>
		</div>

	</form>
	
----TESTDECAMILLE :----<br><br>
	<p>
	AVEC CODE JAVA :
<%Utilisateur user=(Utilisateur)session.getAttribute("user"); 
if (user!=null){%>
<%=user.getPseudo() %>
email :<%=user.getEmail() %>
credit :<%=user.getCredit() %>
<%} %>
</p><br>
<br><br>
<p>USEBEAN =
<!-- id : crée une variable locale,
scope: fait appel à request de notre servlet
class: appelle la classe java. -->
<jsp:useBean id="userTest"
			scope="session"
			class="fr.eni.encheres.bo.Utilisateur"
></jsp:useBean>
<!-- property pseudo: appelle le getter de pseudo
name : rappel de la variable créée en id  -->
	pseudo :<jsp:getProperty property="pseudo" name="userTest"/>
		crédit : <jsp:getProperty property="credit" name="userTest"/>
<br><br>	</p>
	
	
	<p>Expression language: pseudo :${utilisateur.pseudo }
		crédit ${utilisateur.credit }
	<br><br>
----FIN DES TEST----
	
	
	 </p>
	</body>
	
	<footer> Copyright 2021 des fifous du net © </footer> 
	</html>