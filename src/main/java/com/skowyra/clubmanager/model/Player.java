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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name= "player")
public class Player implements Serializable {

		private static final long serialVersionUID = 4175814625095897766L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "player_id", unique = true, nullable = false)
	private Long id;
	
	//Many-to-Many Relationship with Join Table 
//	@OneToMany(mappedBy = "pk.player",fetch = FetchType.EAGER, cascade=CascadeType.ALL)
//	private Set<PlayerMatches> playerMatches = new HashSet<PlayerMatches>(0);
	
	@OneToMany(mappedBy = "pk.player",fetch = FetchType.EAGER, cascade=CascadeType.ALL)
	private List<PlayerMatches> playerMatches = new ArrayList<PlayerMatches>(0);
	
	@ManyToOne(cascade={CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name="team_id", nullable = true)	
    private Team team;
	
	@NotNull
	@Size(min=2, max=30, message="IMIE musi mieć od 2 do 30 znaków!")
	private String firstname;
	@NotNull
	@Size(min=2, max=30, message="NAZWISKO musi mieć od 2 do 30 znaków!")
	private String lastname;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date birthday;
	@NotNull
	@Size(min=2, max=50, message="Podaj adres zamiwszkania!")
	private String adress;

	private Long phone;
	
	@Pattern(message = "Błędny adres e-mail!",
			regexp = "^[a-zA-Z0-9.!#$%&amp;'*+/=?\\^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$")
	private String email;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd-MM-yyyy")
	private Date medicalTest;
	
	public Player(){}
	
	
	public Player(String firstname, String lastname){
		super();
		this.firstname = firstname;
		this.lastname = lastname;	
	}
	
	public Player(String firstname, String lastname, Date birthday,String adress,Long phone,String email, Date medicalTest , Team team){
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.birthday = birthday;
		this.adress = adress;
		this.phone = phone;
		this.email = email;
		this.medicalTest = medicalTest;
		this.team = team;
	}
	


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
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
	
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Date getMedicalTest() {
		return medicalTest;
	}


	public void setMedicalTest(Date medicalTest) {
		this.medicalTest = medicalTest;
	}


	public Team getTeam() {
		return team;
	}


	
/**	public Set<PlayerMatches> getPlayerMatches() {
		return playerMatches;
	}


	public void setPlayerMatches(Set<PlayerMatches> playerMatches) {
		this.playerMatches = playerMatches;
	}
*/

	public void setTeam(Team team) {
		this.team = team;
	}

	 public void setTeamId(Team team) {
         this.team = team;
 }
	
	 public List<PlayerMatches> getPlayerMatches() {
		return playerMatches;
	}


	public void setPlayerMatches(List<PlayerMatches> playerMatches) {
		this.playerMatches = playerMatches;
	}


	@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((adress == null) ? 0 : adress.hashCode());
			result = prime * result
					+ ((birthday == null) ? 0 : birthday.hashCode());
			result = prime * result + ((email == null) ? 0 : email.hashCode());
			result = prime * result
					+ ((firstname == null) ? 0 : firstname.hashCode());
			result = prime * result + ((id == null) ? 0 : id.hashCode());
			result = prime * result
					+ ((lastname == null) ? 0 : lastname.hashCode());
			result = prime * result
					+ ((medicalTest == null) ? 0 : medicalTest.hashCode());
			result = prime * result + ((phone == null) ? 0 : phone.hashCode());
			result = prime * result
					+ ((playerMatches == null) ? 0 : playerMatches.hashCode());
			result = prime * result + ((team == null) ? 0 : team.hashCode());
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
			Player other = (Player) obj;
			if (adress == null) {
				if (other.adress != null)
					return false;
			} else if (!adress.equals(other.adress))
				return false;
			if (birthday == null) {
				if (other.birthday != null)
					return false;
			} else if (!birthday.equals(other.birthday))
				return false;
			if (email == null) {
				if (other.email != null)
					return false;
			} else if (!email.equals(other.email))
				return false;
			if (firstname == null) {
				if (other.firstname != null)
					return false;
			} else if (!firstname.equals(other.firstname))
				return false;
			if (id == null) {
				if (other.id != null)
					return false;
			} else if (!id.equals(other.id))
				return false;
			if (lastname == null) {
				if (other.lastname != null)
					return false;
			} else if (!lastname.equals(other.lastname))
				return false;
			if (medicalTest == null) {
				if (other.medicalTest != null)
					return false;
			} else if (!medicalTest.equals(other.medicalTest))
				return false;
			if (phone == null) {
				if (other.phone != null)
					return false;
			} else if (!phone.equals(other.phone))
				return false;
			if (playerMatches == null) {
				if (other.playerMatches != null)
					return false;
			} else if (!playerMatches.equals(other.playerMatches))
				return false;
			if (team == null) {
				if (other.team != null)
					return false;
			} else if (!team.equals(other.team))
				return false;
			return true;
		}
     
}
