package com.skowyra.clubmanager.model;

import java.io.Serializable;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.EmbeddedId;
import javax.persistence.JoinColumn;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "player_match")
@AssociationOverrides({
		@AssociationOverride(name = "pk.player", 
			joinColumns = @JoinColumn(name = "player_id")),
		@AssociationOverride(name = "pk.matches", 
			joinColumns = @JoinColumn(name = "matches_id")) })
public class PlayerMatches implements Serializable{

	private static final long serialVersionUID = -5543225957579910892L;
	
	
	private PlayerMatchesID pk = new PlayerMatchesID();
	
	private int timePlay;
	private int goals;
	private int yellowCard;
	private int redCard;
	private int shirtNumber;
	
	public PlayerMatches(){}
	
	
	@Transient
	public Player getPlayer() {
		return getPk().getPlayer();
	}
 
	public void setPlayer(Player player) {
		getPk().setPlayer(player);
	}
 
	@Transient
	public Matches getMatches() {
		return getPk().getMatches();
	}
 
	public void setMatches(Matches matches) {
		getPk().setMatches(matches);
	}

	@EmbeddedId
	public PlayerMatchesID getPk() {
		return pk;
	}


	public void setPk(PlayerMatchesID pk) {
		this.pk = pk;
	}


	public int getTimePlay() {
		return timePlay;
	}


	public void setTimePlay(int timePlay) {
		this.timePlay = timePlay;
	}


	public int getGoals() {
		return goals;
	}


	public void setGoals(int goals) {
		this.goals = goals;
	}


	public int getYellowCard() {
		return yellowCard;
	}


	public void setYellowCard(int yellowCard) {
		this.yellowCard = yellowCard;
	}


	public int getRedCard() {
		return redCard;
	}


	public void setRedCard(int redCard) {
		this.redCard = redCard;
	}


	public int getShirtNumber() {
		return shirtNumber;
	}


	public void setShirtNumber(int shirtNumber) {
		this.shirtNumber = shirtNumber;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + goals;
		result = prime * result + ((pk == null) ? 0 : pk.hashCode());
		result = prime * result + redCard;
		result = prime * result + shirtNumber;
		result = prime * result + timePlay;
		result = prime * result + yellowCard;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PlayerMatches other = (PlayerMatches) obj;
		if (goals != other.goals)
			return false;
		if (pk == null) {
			if (other.pk != null)
				return false;
		} else if (!pk.equals(other.pk))
			return false;
		if (redCard != other.redCard)
			return false;
		if (shirtNumber != other.shirtNumber)
			return false;
		if (timePlay != other.timePlay)
			return false;
		if (yellowCard != other.yellowCard)
			return false;
		return true;
	}


	


	
	
}
