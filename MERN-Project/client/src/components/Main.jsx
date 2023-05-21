import ListForm from "./ListForm";
import SongForm from "./SongForm";
import ViewAllSongs from "./ViewAllSongs";

const Main = ()=>{
    return(
        <div className="forms1">
            <div className="forms" >
                <ListForm/>
                <SongForm/>
            </div>
            <ViewAllSongs/>
        </div>
    )
}

export default Main;