const nodemailer = require('nodemailer');
require('dotenv').config();

function sendEmail(remitent, url, accessToken) {

    let transporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 465,
        secure: true, // true for 465, false for other ports
        auth: {
            user: process.env.EMAIL, // generated ethereal user
            pass: process.env.PASS, // generated ethereal password
        },
    });
    transporter.verify().then(() => {
        console.log("ready for send email")
    })

    // send mail with defined transport object
    transporter.sendMail({
        from: `"API Disney" <${process.env.EMAIL}>`, // sender address
        to: remitent, // list of receiver
        subject: "Registro", // Subject line
        text: "Hello world?", // plain text body
        html:
            `<main>
                <h2>API Disney</h2>
            <div style="margin-top: 30px; margin-left: 30px;">
                <h2>Gracias por registrarte ${remitent}</h2>
                <h3>Active su cuenta con el haciendo click en el siguiente <a href="${`${url}/auth/token?token=${accessToken}`}">ENLACE</a></h3>
                <br>
                <h3>O copie el siguiente enlace en su navegador : ${`${url}/auth/token?token=${accessToken}`}</h3>
            </div>
            </main>`, // html body
    });

}


module.exports = sendEmail;
