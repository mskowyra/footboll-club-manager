package com.skowyra.clubmanager.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name= "coach")
public class Coach implements Serializable {

	private static final long serialVersionUID = -9014249485145912309L;
	
	
	@Id
	@Column(name="coach_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long coachId;
	@NotNull
	@Size(min=2, max=30, message="IMIE musi mieć od 2 do 30 znaków!")
	private String firstname;
	@NotNull
	@Size(min=2, max=30, message="NAZWISKO musi mieć od 2 do 30 znaków!")
	private String lastname;
	
	
	
	public Long getCoachId() {
		return coachId;
	}
	public void setCoachId(Long coachId) {
		this.coachId = coachId;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((coachId == null) ? 0 : coachId.hashCode());
		result = prime * result
				+ ((firstname == null) ? 0 : firstname.hashCode());
		result = prime * result
				+ ((lastname == null) ? 0 : lastname.hashCode());
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
		Coach other = (Coach) obj;
		if (coachId == null) {
			if (other.coachId != null)
				return false;
		} else if (!coachId.equals(other.coachId))
			return false;
		if (firstname == null) {
			if (other.firstname != null)
				return false;
		} else if (!firstname.equals(other.firstname))
			return false;
		if (lastname == null) {
			if (other.lastname != null)
				return false;
		} else if (!lastname.equals(other.lastname))
			return false;
		return true;
	}


}
