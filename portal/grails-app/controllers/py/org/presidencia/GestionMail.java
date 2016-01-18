package py.org.presidencia;

import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class GestionMail {

	private static String username;
	private static String password;

	public static boolean sendMail(Map parametros, Contacto contacto,
			Configuracion conf) {
		
		boolean envio = false;
		
		setUsername(conf.getUsuario());
		setUsername(conf.getPassword());

		Properties props = new Properties();
		try {
			props.put("mail.smtp.auth", "true");
			props.put("mail.transport.protocol", "smtps");
			props.put("mail.smtp.socketFactory.port", conf.getPort());
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.host", conf.getHost());
			props.put("mail.smtp.user", conf.getUsuario());
			props.put("mail.smtp.port", conf.getPort());
			props.put("mail.smtp.debug", "true");

			Session sesion = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
						protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
							return new javax.mail.PasswordAuthentication(
									getUsername(), getPassword());
						}
					});
			// sesion.setDebug(true)
			Transport transport;

			transport = sesion.getTransport();

			MimeMessage mensaje = new MimeMessage(sesion);
			MimeBodyPart body = new MimeBodyPart();
			String texto = parametros.get("nombre").toString()
					+ ", "+ parametros.get("apellido").toString()
					+ ", correo: " + parametros.get("email").toString() + "\n"
					+ parametros.get("mensaje").toString();
			body.setText(texto);

			MimeMultipart multipart = new MimeMultipart();
			multipart.addBodyPart(body);
			mensaje.setContent(multipart);
			mensaje.setSubject(parametros.get("asunto").toString());
			mensaje.setFrom(new InternetAddress(parametros.get("email")
					.toString()));
			mensaje.setRecipient(Message.RecipientType.TO, new InternetAddress(
					contacto.getDestinatario()));
			mensaje.setSentDate(new Date());

			transport.connect(conf.getHost(),Integer.parseInt(conf.getPort()), conf.getUsuario(),
					conf.getPassword());
			transport.sendMessage(mensaje, mensaje.getAllRecipients());
			transport.close();
			envio = true;
		} catch (Exception e) {
			e.printStackTrace();
			envio = false;
		}
		
		return envio;

	}

	public static String getUsername() {
		return username;
	}

	public static void setUsername(String user) {
		username = user;
	}

	public static String getPassword() {
		return password;
	}

	public static void setPassword(String pass) {
		password = pass;
	}
}
