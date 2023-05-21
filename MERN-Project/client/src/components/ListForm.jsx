import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const ListForm = ()=>{
    const navigate = useNavigate();
    const [Name,setName] = useState('')

    const handleSubmit = (e)=>{
        e.preventDefault();
        const set = {
            Name
        }
        axios.post(`http://localhost:8000/api/setlists`,set)
        .then(res=>{
            console.log(res.data)
            let result = [res.data]
            localStorage.setItem('ch',JSON.stringify(result))
            navigate('/')
        })
        .catch(err=>{
            console.log(err)
        })
    }
    
    return(
        <div>
            <h1>Add Setlist</h1>
            <form onSubmit={handleSubmit} className="song" >
                <div className="input" >
                    <label>Setlist Name:</label>
                    <input type="text" onChange={(e)=>{setName(e.target.value)}} />
                </div>
                <button type="submit" >Create</button>
            </form>
        </div>
    )
}

export default ListForm;