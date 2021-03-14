defmodule GenReportParallelTest do
  use ExUnit.Case
  doctest GenReportParallel

  describe("build/1") do
    test "builds the report" do
      file_name = "gen_test.csv"

      response = GenReportParallel.build(file_name)

      expected_response = %{
        all_hours: %{
          Cleiton: 12,
          Daniele: 21,
          Danilo: 7,
          Diego: 12,
          Giuliano: 14,
          Jakeliny: 22,
          Joseph: 13,
          Mayk: 19,
          Rafael: 7
        },
        hours_per_month: %{
          Cleiton: %{junio: 4, outubro: 8},
          Daniele: %{abril: 7, dezembro: 5, junio: 1, maio: 8},
          Danilo: %{abril: 1, fevereiro: 6},
          Diego: %{abril: 4, agosto: 4, dezembro: 1, setembro: 3},
          Giuliano: %{abril: 1, fevereiro: 9, maio: 4},
          Jakeliny: %{julho: 8, março: 14},
          Joseph: %{dezembro: 2, março: 3, novembro: 5, setembro: 3},
          Mayk: %{dezembro: 5, julho: 7, setembro: 7},
          Rafael: %{julho: 7}
        },
        hours_per_year: %{
          Cleiton: %{"2016": 3, "2020": 9},
          Daniele: %{"2016": 10, "2017": 3, "2018": 7, "2020": 1},
          Danilo: %{"2018": 1, "2019": 6},
          Diego: %{"2016": 3, "2017": 8, "2019": 1},
          Giuliano: %{"2017": 3, "2019": 6, "2020": 5},
          Jakeliny: %{"2016": 8, "2017": 8, "2019": 6},
          Joseph: %{"2017": 3, "2019": 3, "2020": 7},
          Mayk: %{"2016": 7, "2017": 8, "2019": 4},
          Rafael: %{"2017": 7}
        }
      }

      assert response == expected_response
    end
  end

  describe("build_from_many/1") do
    test "when a file list is provided, builds the report" do
      filenames = ["gen_test.csv", "gen_test.csv"]

      response = GenReportParallel.build_from_many(filenames)

      expected_response =
        {:ok,
         %{
           all_hours: %{
             Cleiton: 24,
             Daniele: 42,
             Danilo: 14,
             Diego: 24,
             Giuliano: 28,
             Jakeliny: 44,
             Joseph: 26,
             Mayk: 38,
             Rafael: 14
           },
           hours_per_month: %{
             Cleiton: %{junio: 8, outubro: 16},
             Daniele: %{abril: 14, dezembro: 10, junio: 2, maio: 16},
             Danilo: %{abril: 2, fevereiro: 12},
             Diego: %{abril: 8, agosto: 8, dezembro: 2, setembro: 6},
             Giuliano: %{abril: 2, fevereiro: 18, maio: 8},
             Jakeliny: %{julho: 16, março: 28},
             Joseph: %{dezembro: 4, março: 6, novembro: 10, setembro: 6},
             Mayk: %{dezembro: 10, julho: 14, setembro: 14},
             Rafael: %{julho: 14}
           },
           hours_per_year: %{
             Cleiton: %{"2016": 6, "2020": 18},
             Daniele: %{"2016": 20, "2017": 6, "2018": 14, "2020": 2},
             Danilo: %{"2018": 2, "2019": 12},
             Diego: %{"2016": 6, "2017": 16, "2019": 2},
             Giuliano: %{"2017": 6, "2019": 12, "2020": 10},
             Jakeliny: %{"2016": 16, "2017": 16, "2019": 12},
             Joseph: %{"2017": 6, "2019": 6, "2020": 14},
             Mayk: %{"2016": 14, "2017": 16, "2019": 8},
             Rafael: %{"2017": 14}
           }
         }}

      assert response == expected_response
    end

    test "when a file list is not provided, returns an error" do
      filenames = "gen_test.csv"

      response = GenReportParallel.build_from_many(filenames)

      expected_response = {:error, "Please provide a list of strings"}

      assert response == expected_response
    end
  end
end
