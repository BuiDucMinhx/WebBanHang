let host = "http://localhost:8080/rest";

var app = angular.module('MyApp', [])
app.controller('MyController', function ($scope) {
    $scope.IsVisible = false;
});
app.controller("ctrl", function($scope, $http){
    $scope.form={}
    $scope.items= []
    $scope.cur = 0;
	$scope.key = "";
    $scope.load_all = function(no){
    	if(no<0) no = 0;
    	if(no>1) no = 1;
    	$scope.cur = no;
        var url = `${host}/products0/${no}`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        }).catch(error => { })
    }
    $scope.load_allaz = function(no){
        var url = `${host}/productsaz/${no}`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        }).catch(error => { })
    }
    $scope.load_allza = function(no){
        var url = `${host}/productsza/${no}`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;   
        }).catch(error => { })
    }
    $scope.load_alllow = function(no){
        var url = `${host}/productslow/${no}`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;  
        }).catch(error => { })
    }
    $scope.load_allhigh = function(no){
        var url = `${host}/productshigh/${no}`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        }).catch(error => { })
    }
    $scope.search = function(no){
        var url = `${host}/search/${no}?keywords=`+$scope.key;
        $http.get(url).then(resp => {
            $scope.items = resp.data;
        }).catch(error => { })
    }
    $scope.load_all(0);
    $scope.IsVisible = true;         
});