defmodule GenReports.ParserTest do
  use ExUnit.Case

  alias GenReports.Parser

  describe "parse_file/1" do
    test "parses the file" do

      filename = "report_test.csv"
      response =
        Parser.parse_file(filename)
        |> Enum.to_list()
        |> List.flatten()

      expected_response = [
        %{customer: "1", food: "pizza", price: 48},
        %{customer: "2", food: "açaí", price: 45},
        %{customer: "3", food: "hambúrguer", price: 31},
        %{customer: "4", food: "esfirra", price: 42},
        %{customer: "5", food: "hambúrguer", price: 49},
        %{customer: "6", food: "esfirra", price: 18},
        %{customer: "7", food: "pizza", price: 27},
        %{customer: "8", food: "esfirra", price: 25},
        %{customer: "9", food: "churrasco", price: 24},
        %{customer: "10", food: "churrasco", price: 36}
      ]

      assert response == expected_response
    end
  end
end
