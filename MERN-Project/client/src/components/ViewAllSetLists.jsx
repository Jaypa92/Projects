import { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate,Link } from "react-router-dom";

const ViewAllSetLists = ()=>{
    const navigate = useNavigate()
    const [lists,setLists] = useState([])
    const [added,setAdded] = useState('')
    const [listA,setListA] = useState([])

    useEffect(()=>{
        axios.get(`http://localhost:8000/api/setlists`)
        .then(res=>{
            console.log(res.data)
            setListA(res.data)
        })
        .catch(err=>{
            console.log(err)
        })
    },[])

    const handleRemove = (id,songId)=>{
        const newList = {
            '$pull':{
                songs:{
                _id:songId
                }
            }
        }

        let set = JSON.parse(localStorage.getItem('ch'))

        let newSet = set.filter((set,i)=>{
            return set._id !== id
        })

        localStorage.setItem('ch',JSON.stringify(newSet))

        axios.put(`http://localhost:8000/api/setlists/${id}`,newList)
        .then(res=>{
            let result = [res.data]
            localStorage.setItem('ch',JSON.stringify(result))
            navigate('/')
        })
        .catch(err=>{
            console.log(err)
        })
    }

    const handleHide = (idx)=>{
       const newList = lists.filter((list,i)=>{
            return i !== idx
        })
        setLists(newList)
        localStorage.setItem('ch',JSON.stringify(newList))
    }

    const handleAdd = (e)=>{
        e.preventDefault();
        
        axios.get(`http://localhost:8000/api/setlists/${added}`)
        .then(res=>{
            console.log(res.data)
            setLists([...lists,res.data])
        })
        .catch(err=>{
            console.log(err)
        })
    }

    const handleDelete = (e,id)=>{
        e.preventDefault();

        let sets = JSON.parse(localStorage.getItem('ch'))

        let temp = sets.filter(set => set._id !== id)
        localStorage.setItem('ch',JSON.stringify(temp))
        
        axios.delete(`http://localhost:8000/api/setlists/${id}`)
        .then(res=>{
            console.log(res)
            navigate('/')
        })
        .catch(err=>{
            console.log(err)
        })
    }

    useEffect(()=>{
        const data = window.localStorage.getItem('ch')
        if (data !== null) setLists(JSON.parse(data))
    },[])

    useEffect(()=>{
        if(lists.length !== 0){
        localStorage.setItem('ch',JSON.stringify(lists))
        }
    },[lists])

    
    return(
        <div className="forms1" >
            <h1>Setlists</h1>
            <form onSubmit={handleAdd} className="list-form" >
                <label>Show:</label>
                <select onChange={(e)=>{setAdded(e.target.value)}} >
                    <option>Please Select Setlist</option>
                    {listA.sort((a,b)=>a.Name>b.Name?1:-1).map((list,i)=>{
                        return(
                            <option key={i} value={list._id}>{list.Name}</option>
                        )
                    })}
                </select>
                <button type="submit" >Show</button>
            </form>
            <div className="forms2" >
            {lists.sort((a,b)=>a.Name>b.Name?1:-1).map((list,i)=>{
                return(
                    <div>
                        <div className="list" >
                            <h2 key={i} >{list.Name}</h2>
                            <Link className="Link" onClick={()=>{handleHide(i)}} >Hide</Link>
                            <Link className="Link" onClick={(e)=>{handleDelete(e,list._id)}} >Delete</Link>
                        </div>
                        {list.songs.map((song,j)=>{
                            return(
                                <div key={j} className="item" >
                                    <div className="song-list" draggable>
                                            <h3><b>{song.title}</b></h3>
                                            <p>{song.tuning}</p>
                                            <p>{song.song_type}</p>
                                            <button className="button" onClick={()=>{handleRemove(list._id,song._id)}}>Remove</button>
                                    </div>
                                </div>
                            )
                        })}
                    </div>
                )
            }
                )
            }
            </div>
        </div>
    )
}

export default ViewAllSetLists;