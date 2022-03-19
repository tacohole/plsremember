import React, { useState } from "react";
// import ReactDOM from "react-dom";
// import { useReducer } from "react/cjs/react.production.min";

// import Sample from "./Sample";
import Subscribe from "./subscribe/Subscribe";
// import Unsubscribe from "./Unsubscribe";

function Home () {

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
                        <Subscribe />
                    </div>
                </div>
            </div>
        </div>
    )

}

export default Home