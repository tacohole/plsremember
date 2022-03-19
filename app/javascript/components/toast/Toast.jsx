import React, { useState, useEffect} from 'react';
import './Toast.css';

const Toast = () => {
    const [toast] = useState();

    const deleteToast = (toast) =>{

    }
    
    return (
        <div className="notification-container top-right">
            <button onClick={deleteToast}>
                X
            </button>
            <div className="notification toast top-right">
                <img src="" alt="" />
              </div>
              <div>
                  <p className="notification-title">Title</p>
                  <p className="notification-message">Message</p>
              </div>
        </div>
    )
}

export default Toast;