function chooseTemp(element) {
    let high = document.querySelector('.high');
    let low = document.querySelector('.low');
    let high_1 = document.querySelector('.high-1');
    let low_1 = document.querySelector('.low-1');
    let high_2 = document.querySelector('.high-2');
    let low_2 = document.querySelector('.low-2');
    let high_3 = document.querySelector('.high-3');
    let low_3 = document.querySelector('.low-3');

    high.innerText = '°167';
    low.innerText = '°100';
    high_1.innerText = '°167';
    low_1.innerText = '°100';
    high_2.innerText = '°167';
    low_2.innerText = '°100';
    high_3.innerText = '°167';
    low_3.innerText = '°100';

}
function remove(element) {
    let one = document.querySelector('.alert-box');
    one.remove();
}