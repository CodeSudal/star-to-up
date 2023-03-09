<!DOCTYPE html>
<html>
<head>
<title>Contact Form</title>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

</head>
<body>
	<form id="contact-form">
		<input type="hidden" name="contact_number"> <label>Name</label>
		<input type="text" name="user_name"> <label>Email</label> <input
			type="email" name="user_email"> <label>Message</label>
		<textarea name="message"></textarea>
		<input type="submit" value="Send">
	</form>
	
	<script type="text/javascript">
	(function() {
		// https://dashboard.emailjs.com/admin/account
		/* emailjs.init('hgRoerm1aeWKedrNw'); */
		/* emailjs.init('service_v72x4pg'); */
		/* emailjs.init('zyI8CgNt7yWzUTNqW9YX0'); */
		/* emailjs.init('nwpJttHh3NhV-NGqV'); */
		emailjs.init('nwpJttHh3NhV-NGqV');
	})();
</script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('contact-form').addEventListener(
				'submit',
				function(event) {
					event.preventDefault();
					// generate a five digit number for the contact_number variable
					this.contact_number.value = Math.random() * 100000 | 0;
					// these IDs from the previous steps
					emailjs.sendForm('contact_service', 'contact_form', this)
							.then(function() {
								console.log('SUCCESS!');
							}, function(error) {
								console.log('FAILED...', error);
							});
				});
	}
	
	
	
    const sendEmail = () => {
        emailjs.init('wupee7273');
        let templateParams  = {
            name : document.getElementById('userName').value,
            phone : document.getElementById('phone').value,
            email : document.getElementById('email').value,
            message : document.getElementById('message').value,
        }
        console.log(templateParams);
        emailjs.send('service_id', 'template_id', templateParams).then(function(response){
            console.log('Success!', response.status, response.text);
            setStatus('success');
        }, function(error){
            console.log('Failed...', error);
            setStatus('fail');
        })
    }

</script>
</body>
</html>