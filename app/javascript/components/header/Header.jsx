import React from 'react';
import { Link } from 'react-router-dom';
import './Header.css'

const Header = () => {
  return (
    <div className="Header">
      <div className="Header-Box">
        <Link to="/" className="Header-Link">Home</Link>
      </div>
      <div className="Header-Box">
        <Link to="/about" className="Header-Link">About</Link>
      </div>
    </div>
  )
}

export default Header