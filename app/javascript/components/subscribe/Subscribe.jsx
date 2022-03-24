import React, { useState } from 'react';
import { handleError } from '../../util/util';

import './Subscribe.css'

function Subscribe () {
    const [user, addUser] = useState('');
  
    const handleChange = (event) => {
        addUser(event.target.value)
    }

    const handleSubmit = (event) => {
        event.preventDefault();

        const userBody = {
            email: user,
        };

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
            console.log(response);
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
                        <input type="text" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+" className="form-control-plaintext mr-3" placeholder="name@domain.com" onChange={handleChange}/>
                       </div>
                       <a href='/subscribed'>
                       <button type="submit" className="btn btn-primary col mr-2">Subscribe</button>
                       </a>
                     </div>
                    </form>
                )
            }
        </div>
    )
}

export default Subscribe