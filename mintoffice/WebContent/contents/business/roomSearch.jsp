<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(function(){
});
</script>
<style>
.form-group{
width:100%;
text-align:center;
margin-top: 5px;
}
.form-group>*{
display:inline-block;
width:17%;
}
#roomSearchTf{
width:200px;
height:30px;
}
</style>
  <div class="form-group">
    <select class="custom-select">
      <option selected="">Start time</option>
      <option value="9">09</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
    </select>
    <select class="custom-select">
      <option selected="">End time</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
    </select>
    <select class="custom-select">
      <option selected="">Capacity</option>
      <option value="1">4</option>
      <option value="2">6</option>
      <option value="3">10</option>
      <option value="3">14</option>
      <option value="3">more</option>
    </select>
  	<input type="text" class="form-control" placeholder="Room number" id="roomSearchTf">&nbsp;
  	<button type="button" class="btn btn-outline-primary btn-sm" >Search</button>
  </div>