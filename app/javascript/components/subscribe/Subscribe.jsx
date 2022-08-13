import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { handleError } from '../../util/util';
import ReCaptchaV2 from 'react-google-recaptcha'

import './Subscribe.css'

function Subscribe () {
    const [user, addUser] = useState('');
    const recaptchaRef = React.createRef();
    let navigate = useNavigate();
  
    const handleChange = (event) => {
        addUser(event.target.value)
    }

    const handleSubmit = (event) => {
        event.preventDefault();

        const captchaToken = recaptchaRef.current.getValue()

        const userBody = {
            email: user,
            captcha: captchaToken
        };

        if (userBody.captcha === '') {
          alert("please prove you're not a robot")
          throw Error('captcha failed')
        }

        const url = '/users/subscribe'
        const token = document.querySelector('meta[name="csrf-token"]').content;
        const requestOptions = {
            method: 'POST',
            headers: {
                'X-CSRF-Token': token,
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userBody)
        }

        fetch(url, requestOptions)
        .then(handleError)
        .catch((error) => console.log(error));
        
        navigate('/subscribed')
    };

    return (
        <div>
            {
                addUser && (
                    <form className="subscribe" onSubmit={handleSubmit}>
                      <div className="form-row">
                       <div className="col-9">
                        <input type="text" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+" className="form-control-plaintext mr-3" placeholder="enter your email here" onChange={handleChange}/>
                       </div>
                       <button type="submit" className="btn btn-primary col mr-2">Subscribe</button>
                     </div>
                     <span>&nbsp;</span>
                     <ReCaptchaV2 
                       sitekey={process.env.REACT_APP_SITE_KEY} 
                       ref={recaptchaRef}/>
                    </form>
                )
            }
        </div>
    )
}

export default Subscribe