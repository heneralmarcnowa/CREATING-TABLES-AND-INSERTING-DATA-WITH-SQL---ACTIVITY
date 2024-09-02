
--1. Select all users who are born between January 1, 2000, and December 31, 2004:
SELECT UserID, Username, FirstName, LastName, DateOfBirth
FROM Users
WHERE DateOfBirth BETWEEN '2000-01-01' AND '2004-12-31';


--2. Select all the posts written by the user with a user_id of 4:
SELECT Posts.PostID, Posts.PostDescription, Posts.DatePosted, Users.UserID, Users.Username
FROM Posts
JOIN Users ON Posts.PostedBy = Users.UserID
WHERE Posts.PostedBy = 4;


--3. Select all the group names existing in the database:
SELECT GroupID, GroupName
FROM Groups;


--4. Select all the group membership requests made by the user with a user_id of 2:
SELECT GroupMembershipRequests.GroupMembershipRequestID, Groups.GroupName, Users.UserID, Users.Username, GroupMembershipRequests.IsGroupMembershipAccepted, GroupMembershipRequests.DateAccepted
FROM GroupMembershipRequests
JOIN Groups ON GroupMembershipRequests.GroupID = Groups.GroupID
JOIN Users ON GroupMembershipRequests.GroupMemberUserID = Users.UserID
WHERE GroupMembershipRequests.GroupMemberUserID = 2;


--5. Select all the friends of the user with a user_id of 2:
SELECT Users.UserID, Users.Username, Users.FirstName, Users.LastName, Users.DateAdded
FROM Users
JOIN Friends ON (Users.UserID = Friends.FriendBeingAdded OR Users.UserID = Friends.FriendWhoAdded)
WHERE (Friends.FriendWhoAdded = 2 OR Friends.FriendBeingAdded = 2)
AND Friends.IsAccepted = true
AND Users.UserID != 2;


--6. Select all the friend requests that the user with a user_id of 1 has sent. The friend request can either be accepted or not yet accepted:
SELECT Friends.FriendID, Users1.Username AS UserWhoAdded, Users2.Username AS FriendBeingAdded, Friends.IsAccepted, Friends.DateAdded
FROM Friends
JOIN Users AS Users1 ON Friends.FriendWhoAdded = Users1.UserID
JOIN Users AS Users2 ON Friends.FriendBeingAdded = Users2.UserID
WHERE Friends.FriendWhoAdded = 1;


--7. Select all the posts visible only for the group with a group_id of 2:
SELECT Posts.PostID, Posts.PostDescription, Posts.DatePosted, Groups.GroupName, Users.Username
FROM Posts
JOIN Groups ON Posts.GroupID = Groups.GroupID
JOIN Users ON Posts.PostedBy = Users.UserID
WHERE Posts.GroupID = 2;


--8. Select all the group membership requests from the group with a group_id of 2 that are not yet accepted:
SELECT GroupMembershipRequests.GroupMembershipRequestID, Groups.GroupName, Users.Username, GroupMembershipRequests.IsGroupMembershipAccepted, GroupMembershipRequests.DateAccepted
FROM GroupMembershipRequests
JOIN Groups ON GroupMembershipRequests.GroupID = Groups.GroupID
JOIN Users ON GroupMembershipRequests.GroupMemberUserID = Users.UserID
WHERE GroupMembershipRequests.GroupID = 2 AND GroupMembershipRequests.IsGroupMembershipAccepted = false;