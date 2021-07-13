/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function ShowHideDiv(){
    var chklect = document.getElementById("lecturer");
    var chkstd = document.getElementById("student");
    var dvLecturer = document.getElementById("dvLecturer");
    var dvStudent = document.getElementById("dvStudent");
    
    dvLecturer.style.display = chklect.checked ? "block" : "none";
    dvStudent.style.display = chkstd.checked ? "block" : "none";
    
}