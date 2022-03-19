import React, { useState } from 'react';
import { handleError } from '../../util/util';

import './Subscribe.css'

function Subscribe () {
    const [user, addUser] = useState('');
    const [isValid, setIsValid] = useState(false);
    const [message, setMessage] = useState('');

    const emailRegExp = RegExp(/\S+@\S+\.\S+/);

    const validateEmail = (event) => {
        const email = event.target.value;
        if (emailRegExp.test(email)) {
            addUser(email);
            setMessage("you've subscribed! verification email sent");
        } else {
            setIsValid(false);
            setMessage("please enter a valid email address");
        }
    }

    const handleSubmit = (event) => {
        event.preventDefault();

        if (user === ' ') return;

        const userBody = {
            email: user,
        };

        const url = 'users/subscribe';
        const token = document.querySelector('meta[name="csrf-token"]').content;

        fetch(url, {
            method: 'POST',
            headers: {
                'X-CSRF-Token': token,
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(userBody),
        })
        .then(handleError)
        .then((response) => {
            if (response.statusCode === 500) {
                setMessage('this email is already subscribed')
            }
            console.log(response);
            window.location.reload(false);
        })
        .catch((error) => console.log(error)); 
    };

    return (
        <div>
            {
                addUser && (
                    <form className="subscribe" onSubmit={handleSubmit}>
                      <div className="form-row">
                       <div className="col-9">
                        <input type="text" className="form-control-plaintext mr-3" placeholder="name@domain.com" onChange={validateEmail}/>
                       </div>
                       <div className={`message ${isValid ? 'success' : 'error'}`}>
                            {message}
                        </div>
                       <button type="submit" className="btn btn-primary col mr-2">Subscribe</button>
                     </div>
                    </form>
                )
            }
        </div>
    )
}

export default Subscribe