<%@ page import="fr.eni.encheres.bo.Utilisateur"%>
<%@ page import="fr.eni.encheres.bo.ArticleVendu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="test.css">
<!-- FEUILLE CSS DE TEST -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Ubuntu:regular,bold&subset=Latin">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Profil de ${vendeur.pseudo}</title>
</head>

<body>

	<div class="logo">
		<a href="ServletAccueil"><img src="images/logoProjet.png"
			alt="accueil" height="80" width="150"></img></a>
	</div>

	<div class="navbar">
		<div class="dropdown">
			<button class="dropbtn">
				MENU <i class="fa fa-bars" aria-hidden="true"></i>
			</button>
			<div class="dropdown-content">
				<a href="ServletEncheres">Encheres</a> <a
					href="ServletVendreArticle">Vendre</a>

				<c:if test="${!empty utilisateur.pseudo}">
					<a href="ServletMonProfil">Mon profil</a>
					<a href="ServletDeconnexion">Se déconnecter</a>
				</c:if>

			</div>
		</div>
	</div>
	<div>
		<ul>
			<li><a href="ServletEncheres">Enchères</a></li>
			<li><a href="ServletVendreArticle">Vendre un article</a></li>

			<c:if test="${!empty utilisateur.pseudo}">
				<li><a href="ServletMonProfil">Mon profil</a></li>
				<li><a href="ServletDeconnexion">Se déconnecter</a></li>
			</c:if>

		</ul>
	</div>


	<h1>Profil de</h1>

	<h2>${vendeur.pseudo}</h2>

	<div class="infosUtilisateur">


		<p>Pseudo : ${vendeur.pseudo}</p>
		<p>Nom : ${vendeur.nom}</p>
		<p>Prénom : ${vendeur.prenom}</p>
		<p>Email : ${vendeur.email}</p>
		<p>Téléphone : ${vendeur.telephone}</p>
		<p>Rue : ${vendeur.rue}</p>
		<p>Code postal : ${vendeur.codePostal}</p>
		<p>Ville : ${vendeur.ville}</p>

		<button class="button4" type="submit" name="Accueil"
			onclick="window.location.href='http://localhost:8080/projetEncheres/ServletAccueil';">Accueil</button>

</div>

</body>

<footer> Copyright 2021 des fifous du net © </footer>
</html>