# Open Todo


To-do lists are notorious for collecting junk: to-do items that you want to remember, but are not very important and thus get consistently put-off. To address the problem of to-do list clutter, we created Open Todo. 

Open Todo will aim to keep to-do lists manageable by automatically deleting to-do items that have not been completed after seven days. The hypothesis is that if the to-do item is not important enough to be completed in seven days, it doesn't belong on your to-do list. 

Check Out Deployed version: https://pacific-shore-4000.herokuapp.com/


## API usage:


<b>Create New User</b>:

* New user will be required to authenicate their sign-up through email

```bash
curl -u user@example.com:password -d "user[username]=Sterling" -d "user[email]=user2@example.com" -d "user[password]=Archer" http://localhost:3000/api/users/
```

<b>Create List</b>:

* Email and password credentials must match the Id of the user id in the HTTP request

```bash
curl -u user@example.com:password -d "list[title]=Things to do today" -d "list[description]=Get these done before the end of day" http://localhost:3000/api/users/1/lists
```

<b>Create Todo</b>:

* Email and password credentials must be owner of the list to create todos for that list id in the HTTP request

```bash
curl -u user@example.com:password -d "todo[description]=Dance if you want to" http://localhost:3000/api/lists/1/todos
```

---

<b>Delete User</b>:

* User will be required to authenicate their sign-up through email and can only delete their own account

```bash
curl -u user@example.com:password -X DELETE http://localhost:3000/api/users/1
```
<b>Delete List</b>:

* Email and password credentials must match the Id of the user id in the HTTP request

```bash
curl -u user@example.com:password -X DELETE http://localhost:3000/api/users/1/lists/1
```
<b>Delete Todo</b>:

* Email and password credentials must be owner of the list to create todos for that list id in the HTTP request

```bash
curl -u user@example.com:password -X DELETE http://localhost:3000/api/todos/1
```

---

<b>Update List</b>:

* Email and password credentials must match the Id of the user id in the HTTP request

```bash
curl -X PUT -u user@example.com:password -d "list[description]=This is my first list" http://localhost:3000/api/users/1/lists/1

curl -X PUT -u user@example.com:password -d "list[permissions]=This is my first list" http://localhost:3000/api/users/1/lists/1
```
<b>Update Todo</b>:

* Email and password credentials must be owner of the list to create todos for that list id in the HTTP request

```bash
curl -X PUT -u user@example.com:password -d "todo[if_complete]=0" http://localhost:3000/api/todos/1

curl -X PUT -u user@example.com:password -d "todo[description]=Change My Todo Title" http://localhost:3000/api/todos/1
```

---

<b>Index of Users</b>:

```bash
curl -X GET -u user@example.com:password http://localhost:3000/api/users
```

<b>Index of Lists</b>:

* Email and password credentials must match the Id of the user id in the HTTP request

```bash
curl -X GET -u user@example.com:password http://localhost:3000/api/users
```

<b>Index of Todos for a List</b>:

* Email and password credentials must be owner of the list to create todos for that list id in the HTTP request

```bash
curl -X GET -u user@example.com:password http://localhost:3000/api/lists/1/todos
```
