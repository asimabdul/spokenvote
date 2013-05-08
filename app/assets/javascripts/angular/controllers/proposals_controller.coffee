ProposalListCtrl = ($scope, $routeParams, $location, proposals, current_user, HubSelected, SpokenvoteCookies) ->
  $scope.hubSelection = HubSelected
  $scope.filterSelection = $routeParams.filter
  $scope.proposals = proposals
  $scope.currentUser = current_user
  $scope.spokenvoteSession = SpokenvoteCookies

  $scope.setFilter = (filterSelected) ->
    $location.search('filter', filterSelected)

ProposalListCtrl.$inject = ['$scope', '$routeParams', '$location', 'proposals', 'current_user', 'HubSelected', 'SpokenvoteCookies']
angularApp.controller 'ProposalListCtrl', ProposalListCtrl

ProposalViewCtrl = ($scope, $location, proposal, current_user, SessionSettings, $modal) ->
  $scope.proposal = proposal
  $scope.currentUser = current_user

  $scope.defaultGravatar = SessionSettings.defaultGravatar

  $scope.vote = ->
    $modal
      template: '/assets/proposals/_voteModal.html.haml'
      Controller: 'VoteNewCtrl'
      show: true
      backdrop: 'static'
      scope: $scope

  $scope.improve = ->
    $modal
      template: '/assets/proposals/_improveProposalModal.html.haml'
      Controller: 'ProposalImroveCtrl'
      show: true
      backdrop: 'static'
      scope: $scope

ProposalViewCtrl.$inject = ['$scope', '$location', 'proposal', 'current_user', 'SessionSettings', '$modal']
angularApp.controller 'ProposalViewCtrl', ProposalViewCtrl




