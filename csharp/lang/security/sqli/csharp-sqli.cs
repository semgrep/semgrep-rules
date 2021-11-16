using System.String;
using System.string;
using System.Text.StringBuilder;
using System.Data.Common.DbCommand;
using System.Data;
using System.Data.SqlClient;


namespace Sqli
{
   public class Sqli
   {
        public void sqli1(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               SqlCommand command= connection.CreateCommand();
               // ruleid: csharp-sqli
               command.CommandText = string.Format("SELECT c.name AS column_name,t.name AS type_name,c.max_length,c.precision,c.scale,             CAST(CASE WHEN EXISTS(SELECT * FROM sys.index_columns AS i WHERE i.object_id=c.object_id AND i.column_id=c.column_id) THEN 1 ELSE 0 END AS BIT) AS column_indexed             FROM sys.columns AS c              JOIN sys.types AS t ON c.user_type_id=t.user_type_id              WHERE c.object_id = OBJECT_ID('{0}')              ORDER BY c.column_id;", sqli);
            }
        }

        public void sqli2(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               SqlCommand command= connection.CreateCommand();
               // ruleid: csharp-sqli
               command.CommandText = String.Format("SELECT c.name AS column_name,t.name AS type_name,c.max_length,c.precision,c.scale,             CAST(CASE WHEN EXISTS(SELECT * FROM sys.index_columns AS i WHERE i.object_id=c.object_id AND i.column_id=c.column_id) THEN 1 ELSE 0 END AS BIT) AS column_indexed             FROM sys.columns AS c              JOIN sys.types AS t ON c.user_type_id=t.user_type_id              WHERE c.object_id = OBJECT_ID('{0}')              ORDER BY c.column_id;", sqli);
               command.CommandTimeout = 15;
               command.CommandType = CommandType.Text;
            }
        }
        public void sqli3(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
                  connection.Open();
                  SqlCommand command= connection.CreateCommand();
                  StringBuilder stringBuilder = new StringBuilder("SELECT Id, ItemType");
                  stringBuilder.AppendFormat(" FROM {0} ", sqli);
                  // ruleid: csharp-sqli
                  command.CommandText = stringBuilder.ToString();
                  command.CommandTimeout = 15;
                  command.CommandType = CommandType.Text;
            }
        }

        public void sqli4(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               SqlCommand command= connection.CreateCommand();
               // ruleid: csharp-sqli
               command.CommandText = string.Concat(new string[]
               {
               "UPDATE [dbo].[tblBigTableReference] SET tblBigTableReference.PropertyName = @NewPropertyName FROM [dbo].[tblBigTableReference] INNER JOIN [dbo].[",sqli,"] ON ",sqli,".pkId = tblBigTableReference.pkId WHERE ", sqli, ".StoreName = @storeName AND tblBigTableReference.PropertyName = @OldPropertyName"
               });
               command.CommandTimeout = 15;
               command.CommandType = CommandType.Text;
            }
        }

        public void sqli5(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
                  connection.Open();
                  SqlCommand command= connection.CreateCommand();
                  // ruleid: csharp-sqli
                  command.CommandText = String.Concat(new string[]
                     {
                  "UPDATE [dbo].[tblBigTableReference] SET tblBigTableReference.PropertyName = @NewPropertyName FROM [dbo].[tblBigTableReference] INNER JOIN [dbo].[",sqli,"] ON ",sqli,".pkId = tblBigTableReference.pkId WHERE ", sqli, ".StoreName = @storeName AND tblBigTableReference.PropertyName = @OldPropertyName"});
                  command.CommandTimeout = 15;
                  command.CommandType = CommandType.Text;
            }
        }

        public void sqli6(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               // ruleid: csharp-sqli
               SqlCommand command = new SqlCommand(sqli)
            }
        }

        public void sqli7(string sqli)
        {

            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               // ruleid: csharp-sqli
               SqlCommand command = new SqlCommand(string.Format("SELECT c.name AS column_name,t.name AS type_name,c.max_length,c.precision,c.scale,CAST(CASE WHEN EXISTS(SELECT * FROM sys.index_columns AS i WHERE i.object_id=c.object_id AND i.column_id=c.column_id) THEN 1 ELSE 0 END AS BIT) AS column_indexed             FROM sys.columns AS c              JOIN sys.types AS t ON c.user_type_id=t.user_type_id              WHERE c.object_id = OBJECT_ID('{0}')              ORDER BY c.column_id;", sqli));
            }
        }

        public void sqli8(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               // ruleid: csharp-sqli
               SqlCommand command = new SqlCommand(String.Format("SELECT c.name AS column_name,t.name AS type_name,c.max_length,c.precision,c.scale,CAST(CASE WHEN EXISTS(SELECT * FROM sys.index_columns AS i WHERE i.object_id=c.object_id AND i.column_id=c.column_id) THEN 1 ELSE 0 END AS BIT) AS column_indexed             FROM sys.columns AS c              JOIN sys.types AS t ON c.user_type_id=t.user_type_id              WHERE c.object_id = OBJECT_ID('{0}')              ORDER BY c.column_id;", sqli));
            }
        }

        public void sqli9(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               StringBuilder stringBuilder = new StringBuilder("SELECT Id, ItemType");
               stringBuilder.AppendFormat(" FROM {0} ", sqli);
               // ruleid: csharp-sqli
               SqlCommand command= new SqlCommand(stringBuilder.ToString());
            }
        }

        public void sqli10(string sqli)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
               connection.Open();
               String sqlcommand = String.Concat(new string[]
                  {
            "UPDATE [dbo].[tblBigTableReference] SET tblBigTableReference.PropertyName = @NewPropertyName FROM [dbo].[tblBigTableReference] INNER JOIN [dbo].[",sqli,"] ON ",sqli,".pkId = tblBigTableReference.pkId WHERE ", sqli, ".StoreName = @storeName AND tblBigTableReference.PropertyName = @OldPropertyName"
                  });
               // ruleid: csharp-sqli
               SqlCommand command= new SqlCommand(sqlcommand);
            }
        }

      public void sqli11(string sqli)
      {
         using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
            connection.Open();
            // ruleid: csharp-sqli
            SqlCommand command= new SqlCommand(sqli);
         }
      }

      public void sqli12(string sqli)
      {
         using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
            connection.Open();
            SqlCommand command= connection.CreateCommand();
            // ruleid: csharp-sqli
            command.CommandText = sqli;
            command.CommandTimeout = 15;
            command.CommandType = CommandType.Text;
         }
      }

      public void sqli13()
      {
         using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=SSPI;")) {
            string sql = "SELECT * FROM Customers WHERE CustomerId = @CustomerId";
            // ok: csharp-sqli
            SqlCommand command = new SqlCommand(sql);
            command.Parameters.Add(new SqlParameter("@CustomerId", System.Data.SqlDbType.Int));
            command.Parameters["@CustomerId"].Value = 1;
         }
      }
   }
}
