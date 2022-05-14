import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { handleError } from '../../util/util';
import ReCaptchaV2 from 'react-google-recaptcha'

import './Subscribe.css'

function Subscribe () {
    const [user, addUser] = useState('');
    let navigate = useNavigate();
  
    const handleChange = (event) => {
        addUser(event.target.value)
    }

    const handleToken = (token) => {
        setForm((currentForm) => {
         return {...currentForm, token }
        })
      }

    const handleExpire = () => {
        setForm((currentForm) => {
         return {...currentForm, token: null }
        })
      }

    const handleSubmit = (event) => {
        event.preventDefault();

        const userBody = {
            email: user,
        };

        const url = '/users/subscribe'
        const token = document.querySelector('meta[name="csrf-token"]').content;
        const requestOptions = {
            method: 'POST',
            headers: {
                'X-CSRF-Token': token,
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userBody),
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
                        <input type="text" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+" className="form-control-plaintext mr-3" placeholder="name@domain.com" onChange={handleChange}/>
                       </div>
                       <ReCaptchaV2 sitekey={process.env.REACT_APP_SITE_KEY} 
                       onChange={handleToken}
                       onExpire={handleExpire}/>
                       <button type="submit" className="btn btn-primary col mr-2">Subscribe</button>
                     </div>
                    </form>
                )
            }
        </div>
    )
}

export default Subscribe