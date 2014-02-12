package com.skowyra.clubmanager.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name= "matches")
public class Matches implements Serializable {

	private static final long serialVersionUID = -4893301768835376662L;

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "matches_id", unique = true, nullable = false)
	private Long matchesId;
	
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date dateMatches;
	
	private String opponent;
	private String typeMatches;
	private String result;
	
	//Many-to-Many Relationship with Join Table 
//	@OneToMany(mappedBy = "pk.matches",fetch = FetchType.EAGER, cascade=CascadeType.ALL)
//	private Set<PlayerMatches> playerMatches = new HashSet<PlayerMatches>(0);
	
	
	@OneToMany(mappedBy = "pk.matches",fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	private List<PlayerMatches> playerMatches = new ArrayList<PlayerMatches>(0);
	
	
	public Matches(){}
	
	public Matches(Date dateMatches, String opponent, String typeMatches, String result){
		super();
		this.dateMatches = dateMatches;
		this.opponent = opponent;
		this.typeMatches = typeMatches;
		this.result = result;
	}
	
//	public Matches(Date dateMatches, String opponent, String typeMatches, String result, Set<PlayerMatches> playerMatches){
//		super();
//		this.dateMatches = dateMatches;
//		this.opponent = opponent;
//		this.typeMatches = typeMatches;
//		this.result = result;
//		this.playerMatches = playerMatches;
//	}

	public Long getMatchesId() {
		return matchesId;
	}

	public void setMatchesId(Long matchesId) {
		this.matchesId = matchesId;
	}

	public Date getDateMatches() {
		return dateMatches;
	}

	public void setDateMatches(Date dateMatches) {
		this.dateMatches = dateMatches;
	}

	public String getOpponent() {
		return opponent;
	}

	public void setOpponent(String opponent) {
		this.opponent = opponent;
	}

	public String getTypeMatches() {
		return typeMatches;
	}

	public void setTypeMatches(String typeMatches) {
		this.typeMatches = typeMatches;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<PlayerMatches> getPlayerMatches() {
		return playerMatches;
	}

	public void setPlayerMatches(List<PlayerMatches> playerMatches) {
		this.playerMatches = playerMatches;
	}

/**	
	public Set<PlayerMatches> getPlayerMatches() {
		return playerMatches;
	}

	public void setPlayerMatches(Set<PlayerMatches> playerMatches) {
		this.playerMatches = playerMatches;
	}
*/
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((dateMatches == null) ? 0 : dateMatches.hashCode());
		result = prime * result
				+ ((matchesId == null) ? 0 : matchesId.hashCode());
		result = prime * result
				+ ((opponent == null) ? 0 : opponent.hashCode());
		result = prime * result
				+ ((playerMatches == null) ? 0 : playerMatches.hashCode());
		result = prime * result
				+ ((this.result == null) ? 0 : this.result.hashCode());
		result = prime * result
				+ ((typeMatches == null) ? 0 : typeMatches.hashCode());
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
		Matches other = (Matches) obj;
		if (dateMatches == null) {
			if (other.dateMatches != null)
				return false;
		} else if (!dateMatches.equals(other.dateMatches))
			return false;
		if (matchesId == null) {
			if (other.matchesId != null)
				return false;
		} else if (!matchesId.equals(other.matchesId))
			return false;
		if (opponent == null) {
			if (other.opponent != null)
				return false;
		} else if (!opponent.equals(other.opponent))
			return false;
		if (playerMatches == null) {
			if (other.playerMatches != null)
				return false;
		} else if (!playerMatches.equals(other.playerMatches))
			return false;
		if (result == null) {
			if (other.result != null)
				return false;
		} else if (!result.equals(other.result))
			return false;
		if (typeMatches == null) {
			if (other.typeMatches != null)
				return false;
		} else if (!typeMatches.equals(other.typeMatches))
			return false;
		return true;
	}
	
}
