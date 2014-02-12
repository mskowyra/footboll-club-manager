package com.skowyra.clubmanager.model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

/**
 * Domain model
 * Part of entity 'PlayerMatches' used to realize many to many between 'Player' and 'Matches'
 */

@Embeddable
public class PlayerMatchesID implements Serializable{

		private static final long serialVersionUID = 7606929237786162820L;
	
	/**
	 * Many to one mapping for entity 'Player'
    */	
	private Player player;
	
	/**
     * Many to one mapping for entity 'Matches'
     */
	private Matches matches;
	
		
	@ManyToOne
	public Player getPlayer() {
		return player;
	}
	public void setPlayer(Player player) {
		this.player = player;
	}
	@ManyToOne
	public Matches getMatches() {
		return matches;
	}
	public void setMatches(Matches matches) {
		this.matches = matches;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((matches == null) ? 0 : matches.hashCode());
		result = prime * result + ((player == null) ? 0 : player.hashCode());
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
		PlayerMatchesID other = (PlayerMatchesID) obj;
		if (matches == null) {
			if (other.matches != null)
				return false;
		} else if (!matches.equals(other.matches))
			return false;
		if (player == null) {
			if (other.player != null)
				return false;
		} else if (!player.equals(other.player))
			return false;
		return true;
	}
	
}
