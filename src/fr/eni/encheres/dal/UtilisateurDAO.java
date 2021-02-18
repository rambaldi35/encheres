package fr.eni.encheres.dal;

import java.util.List;

import fr.eni.encheres.BusinessException;
import fr.eni.encheres.bo.Utilisateur;

public interface UtilisateurDAO {

	// Pour vérifier lors de la connexion si le pseudo est présent en BDD
	// et lors de la création pour que le pseudo soit unique
	public List<Utilisateur> selectAll() throws BusinessException;

	public Utilisateur selectByPseudo(String pseudo) throws BusinessException;

	void ajoutUtilisateur(Utilisateur utlisateur) throws BusinessException;

	// Méthode à tester /!\ => à lier avec pageMonProfil => bouton "Supprimer mon compte" (cf.maquette)
	public void supprimerUtilisateur(int no_utilisateur) throws BusinessException;

	
	void modifierUtilisateur(Utilisateur utilisateur);


}
