package py.org.presidencia;

import java.util.Date;


public class CalendarWrapped {
	
	private String fvalue;
	private String fecha;
	private Long id;
	private String titulo;
	private String subTitulo;
	private Long idSelected;
	private String fechaAgenda;
	private Date date;
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getSubTitulo() {
		return subTitulo;
	}
	public void setSubTitulo(String subTitulo) {
		this.subTitulo = subTitulo;
	}
	public String getFvalue() {
		return fvalue;
	}
	public void setFvalue(String fvalue) {
		this.fvalue = fvalue;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getIdSelected() {
		return idSelected;
	}
	public void setIdSelected(Long idSelected) {
		this.idSelected = idSelected;
	}
	public String getFechaAgenda() {
		return fechaAgenda;
	}
	public void setFechaAgenda(String fechaAgenda) {
		this.fechaAgenda = fechaAgenda;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	

}
