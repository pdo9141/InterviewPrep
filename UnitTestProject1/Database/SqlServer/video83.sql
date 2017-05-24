--https://www.youtube.com/watch?v=R-5erLdA-FU&list=PL08903FB7ACA1C2FB&index=83

Alter procedure spTransaction1
as 
Begin 
    Begin Tran
    Begin Try 
         Update TableA Set Name = 'Mark Transaction 1' where Id = 1 
         Waitfor delay '00:00:05' 
         Update TableB Set Name = 'Mary Transaction 1' where Id = 1 
         -- If both the update statements succeeded.
         -- No Deadlock occurred. So commit the transaction.
         Commit Transaction
         Select 'Transaction Successful'   
    End Try
    Begin Catch
         -- Check if the error is deadlock error
         If(ERROR_NUMBER() = 1205)
         Begin
             Select 'Deadlock. Transaction failed. Please retry'
         End
         -- Rollback the transaction
         Rollback
    End Catch   
End

Alter procedure spTransaction2 
as 
Begin 
    Begin Tran
    Begin Try
         Update TableB Set Name = 'Mary Transaction 2' where Id = 1
         Waitfor delay '00:00:05'
         Update TableA Set Name = 'Mark Transaction 2' where Id = 1
         Commit Transaction
         Select 'Transaction Successful'   
    End Try
    Begin Catch
         If(ERROR_NUMBER() = 1205)
         Begin
             Select 'Deadlock. Transaction failed. Please retry'
        End
         Rollback
    End Catch   
End