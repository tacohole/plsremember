import React from 'react';

const Subscribed = () => {
    return (
        <div className="vw-100 vh-100 primary-color d-flex justify-content-center">
            <div className="jumbotron jumbotron-fluid bg-transparent">
                <div className="container secondary-color">
                    <h1 className="display-4">Please Remember</h1>
                    <p>
                        A joyful reminder sent to your inbox once daily
                    </p>
                    <hr className="my-4"/>
                     <div>
                       <p>
                           Thanks for subscribing. Please check your email for a verification link.
                       </p>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Subscribed