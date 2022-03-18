import React, { useState } from 'react';

function Subscribe () {
    const [user, addUser] = useState('');

    const handleChange = (event) => {
        addUser(event.target.value);
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
        .then((response) => {
            if (response.ok) {
                return response.json();
            }
            throw new Error('failed to add user') 
        })
        .then((response) => {
            console.log(response);
            window.location.reload(false);
        })
        .catch(() => console.log('an error occurred adding user')); 
    };

    return (
        <div>
            {
                addUser && (
                    <form className="subscribe" onSubmit={handleSubmit}>
                      <div className="form-row">
                       <div className="col-9">
                        <input type="text" className="form-control-plaintext mr-3" placeholder="name@domain.com" onChange={handleChange}/>
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