defmodule GenReportParallel.ParserTest do
  use ExUnit.Case

  alias GenReportParallel.Parser

  describe "parse_file/1" do
    test "parses the file" do
      file_name = "gen_test.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        [:Daniele, 7, "29", :abril, :"2018"],
        [:Mayk, 4, "9", :dezembro, :"2019"],
        [:Daniele, 5, "27", :dezembro, :"2016"],
        [:Mayk, 1, "2", :dezembro, :"2017"],
        [:Giuliano, 3, "13", :fevereiro, :"2017"],
        [:Cleiton, 1, "22", :junio, :"2020"],
        [:Giuliano, 6, "18", :fevereiro, :"2019"],
        [:Jakeliny, 8, "18", :julho, :"2017"],
        [:Joseph, 3, "17", :março, :"2017"],
        [:Jakeliny, 6, "23", :março, :"2019"],
        [:Cleiton, 3, "20", :junio, :"2016"],
        [:Daniele, 5, "1", :maio, :"2016"],
        [:Giuliano, 1, "2", :abril, :"2020"],
        [:Daniele, 3, "5", :maio, :"2017"],
        [:Daniele, 1, "26", :junio, :"2020"],
        [:Diego, 3, "11", :setembro, :"2016"],
        [:Mayk, 7, "28", :julho, :"2017"],
        [:Mayk, 7, "3", :setembro, :"2016"],
        [:Danilo, 6, "28", :fevereiro, :"2019"],
        [:Diego, 4, "15", :agosto, :"2017"],
        [:Cleiton, 8, "3", :outubro, :"2020"],
        [:Giuliano, 4, "24", :maio, :"2020"],
        [:Rafael, 7, "1", :julho, :"2017"],
        [:Danilo, 1, "7", :abril, :"2018"],
        [:Diego, 1, "10", :dezembro, :"2019"],
        [:Joseph, 5, "3", :novembro, :"2020"],
        [:Diego, 4, "2", :abril, :"2017"],
        [:Joseph, 3, "10", :setembro, :"2019"],
        [:Jakeliny, 8, "15", :março, :"2016"],
        [:Joseph, 2, "27", :dezembro, :"2020"]
      ]

      assert response == expected_response
    end
  end
end
