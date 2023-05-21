import { useState } from "react"
import axios from "axios"
import { useNavigate } from "react-router-dom"

const SongForm = ()=>{
    const navigate = useNavigate()
    const [title,setTitle] = useState("")
    const [tuning, setTuning] = useState("")
    const [song_type,setType] = useState("")

    const handleSubmit = (e)=>{
        e.preventDefault();
        const song = {
            title,
            tuning,
            song_type
        }
        axios.post(`http://localhost:8000/api/songs`,song)
        .then(res=>{
            console.log(res.data)
            navigate('/')
        })
        .catch(err=>{
            console.log(err)
        })
    }

return(
    <div>
        <h1>Add Song</h1>
        <form onSubmit={handleSubmit} className="song" >
            <div className="input" >
                <label>Song Name: </label>
                <input type="text" onChange={((e)=>{setTitle(e.target.value)})} />
            </div>
            <div className="input" >
                <label>Tuning: </label>
                <input type="text" onChange={(e)=>{setTuning(e.target.value)}} />
            </div>
            <div className="input" >
                <label>Song Type: </label>
                <input type="text" onChange={(e)=>{setType(e.target.value)}} />
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
)
}

export default SongForm