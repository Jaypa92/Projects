import { useEffect, useState } from "react";
import axios from 'axios'
import { useNavigate } from "react-router-dom";

const ViewAllSongs = ()=>{
    const navigate = useNavigate()
    const [song,setSongs] = useState([])
    const [lists,setLists] = useState([])
    const [set,setSet] = useState([])

    useEffect(()=>{
        axios.get(`http://localhost:8000/api/songs`)
        .then(res=>{
            console.log(res.data)
            setSongs(res.data)
        })
        .catch(err=>{
            console.log(err)
        })
    },[])

    useEffect(()=>{
        axios.get(`http://localhost:8000/api/setlists`)
        .then(res=>{
            console.log(res.data)
            setLists(res.data)
        })
        .catch(err=>{
            console.log(err)
        })
    },[])

    const handleSelect = (e,name,tune,type,id)=>{
        e.preventDefault();
        const Song =
        {'$push': {
            songs:[{
            title:name,
            tuning:tune,
            song_type:type
        }]}}

        let lists = JSON.parse(localStorage.getItem('ch'))

        let newlists = lists.filter((list,i)=>{
            return list._id !== id
        })

        localStorage.setItem('ch',JSON.stringify(newlists))
        
        axios.put(`http://localhost:8000/api/setlists/${id}`,Song)
        .then(res=>{
            console.log(res.data)
            let here = [res.data]
                localStorage.setItem('ch',[JSON.stringify(here)])
            
            navigate('/')
    })
    .catch(err=>{
        console.log(err)
    })
        
    }

    const handleDelete = (e,id)=>{
        e.preventDefault();
        axios.delete(`http://localhost:8000/api/songs/${id}`)
        .then(res=>{
            console.log(res)
            navigate('/')
        })
    }

    return(
        <div>
            <h1>Songs</h1>
            <table>
                <tr>
                    <th>Song Name</th>
                    <th>Tuning</th>
                    <th>Song Type</th>
                    <th>Add to Set</th>
                </tr>
                            
            {song.sort((a,b)=>a.title>b.title?1:-1).map((tune,i)=>{
                return(
                    <tr>
                            <td key={i}>{tune.title}</td>
                            <td>{tune.tuning}</td>
                            <td>{tune.song_type}</td>
                            <td><form onSubmit={(e)=>{handleSelect(e,tune.title,tune.tuning,tune.song_type,set)}} >
                                <div className="list-add" >
                                    <select name="list" onChange={(e)=>{setSet(e.target.value)}}>
                                        <option>Please Select a List</option>
                                        {lists.sort((a,b)=>a.Name>b.Name?1:-1).map((list,i)=>{
                                            return(
                                                <option key={i} value={list._id} >{list.Name}</option>
                                                )
                                            })}
                                    </select>
                                    <button type="submit" >Add</button>
                                    <button onClick={(e)=>{handleDelete(e,tune._id)}} >Delete</button>
                                </div>
                            </form>
                        </td>
                    </tr>
                )
            })}
            </table>
        </div>
    )
}

export default ViewAllSongs;