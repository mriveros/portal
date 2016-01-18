package py.org.presidencia

class Usuario {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	String email	
	String firstName
	String lastName

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email nullable: true
		firstName nullable: true
		lastName nullable: true
	}
	
	String toString(){
		return "${username}"
	}
	
}
