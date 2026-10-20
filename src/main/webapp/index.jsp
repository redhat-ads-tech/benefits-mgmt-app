<% 
request.getSession(true);
%>

<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Acme Inc. Benefits Management</title>
	<script src="/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="/bower_components/angular/angular.min.js"></script>
	<script src="/bower_components/angular-route/angular-route.min.js"></script>
	<script src="/bower_components/angular-sanitize/angular-sanitize.min.js"></script>

	<script src="/bower_components/angular-bootstrap/ui-bootstrap-tpls.min.js"></script>

	<!-- PatternFly Custom Componets -  Sidebar, Popovers and Datatables Customizations -->
	<!-- Note: jquery.dataTables.js must occur in the html source before patternfly*.js.-->
	<script src="/bower_components/patternfly/dist/js/patternfly.min.js"></script>
	<script src="/bower_components/angular-patternfly/dist/angular-patternfly.min.js"></script>

	<!-- MatchHeight - Used to make sure dashboard cards are the same height -->
	<script src="/bower_components/matchHeight/jquery.matchHeight.js"></script>

	<!-- Isotope - Masonry layout for storefront -->
	<script src="/bower_components/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="/bower_components/isotope/dist/isotope.pkgd.min.js"></script>
	<script src="/bower_components/keycloak/dist/keycloak.min.js"></script>
	<script src="/app/app.js"></script>
	<script src="/app/routes/routes.js"></script>
	<script src="/app/controllers/controllers.js"></script>
	<script src="/app/services/cart.js"></script>
	<script src="/app/services/catalog.js"></script>
	<script src="/app/directives/header.js"></script>
	<link rel="stylesheet" href="/app/css/coolstore.css" />

	<link rel="stylesheet" href="/bower_components/patternfly/dist/css/patternfly.min.css" />
	<link rel="stylesheet" href="/bower_components/patternfly/dist/css/patternfly-additions.min.css" />

	<link rel="stylesheet" href="/bower_components/angular-patternfly/dist/styles/angular-patternfly.min.css" />

	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
	<div header></div>
	<pf-notification-list></pf-notification-list>
	<div ng-view></div>
	<div id="revision" style="position:fixed;bottom:0;left:0;right:0;text-align:center;color:#999;font-size:11px;padding:4px;background:rgba(255,255,255,0.9)"></div>
<script>
(function(){
  fetch('/revision.json').then(function(r){return r.json()}).then(function(d){
    var ago='';
    if(d.date){
      var ms=Date.now()-new Date(d.date).getTime();
      var s=Math.floor(ms/1000),m=Math.floor(s/60),h=Math.floor(m/60);
      if(h>=24){ago=new Date(d.date).toLocaleString()}
      else if(h>=1){ago=h+' hour'+(h>1?'s':'')+' ago'}
      else if(m>=1){ago=m+' minute'+(m>1?'s':'')+' ago'}
      else{ago='just now'}
    }
    var sha=d.sha&&d.sha!=='unknown'?d.sha.substring(0,8):'';
    var parts=[];
    if(sha)parts.push(sha);
    if(d.message&&d.message!=='local build')parts.push(d.message);
    if(ago)parts.push(ago);
    if(parts.length)document.getElementById('revision').textContent='Build: '+parts.join(' \u00b7 ');
  }).catch(function(){});
})();
</script>
</body>

</html>