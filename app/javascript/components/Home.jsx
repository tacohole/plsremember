import React from "react";

import Sample from "./Sample";
import Subscribe from "./subscribe/Subscribe";
// import Unsubscribe from "./Unsubscribe";

function Home () {

    return (
        <div className="vw-100 vh-100 primary-color d-flex justify-content-center">
            <div className="jumbotron jumbotron-fluid bg-transparent">
                <div className="container secondary-color">
                    <h1 className="display-4">please remember</h1>
                    <p>
                        a joyful reminder sent to your inbox every day
                    </p>
                    <hr className="my-4"/>
                     <div>
                        <Subscribe />
                    </div>
                </div>
            </div>
        </div>
    )

}

export default Home