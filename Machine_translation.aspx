using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlDataReader rdr = null;
            SqlConnection con = null;
            SqlCommand cmd = null;

            try
            {         
                // Open connection to the database
                string ConnectionString = "server=KO-DCON-003\\SQL2014;uid=sa;"+
                    "pwd=iaf349; database=LanguageDataBase";
                con = new SqlConnection(ConnectionString);
                con.Open();

                // Set up a command with the given query and associate
                // this with the current connection.
                string CommandText = "SELECT Translation" +
                                     "  FROM TranslationTable" +
                                     " WHERE (MainSentence LIKE @Find)";
                cmd = new SqlCommand(CommandText);
                cmd.Connection = con;

                // Add LastName to the above defined paramter @Find
                cmd.Parameters.Add(
                    new SqlParameter(
                    "@Find", // The name of the parameter to map
                    System.Data.SqlDbType.NVarChar, // SqlDbType values
                    500, // The width of the parameter
                    "MainSentence"));  // The name of the source column

                // Fill the parameter with the value retrieved
                // from the text field
                cmd.Parameters["@Find"].Value = richTextBox1.Text;

                // Execute the query
                rdr = cmd.ExecuteReader();

                // Fill the list box with the values retrieved
                richTextBox2.Clear();
                while(rdr.Read())
                {
                    
                    richTextBox2.Text= (rdr["Translation"].ToString());

                   // " " + rdr["LastName"].ToString());
                }
            }
            catch(Exception ex)
            {
                // Print error message
                MessageBox.Show(ex.Message);
            }
            finally
            {
                // Close data reader object and database connection
                if (rdr != null)
                    rdr.Close();

                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
        }
