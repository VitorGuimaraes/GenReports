defmodule GenReports.Parser do
  @moduledoc """
    Reads a csv file line per line by Stream and returns
    a File.Stream in the following format:
    #Stream<[
      enum: %File.Stream{
        line_or_bytes: :line,
        modes: [:raw, :read_ahead, :binary],
        path: "reports/report_test.csv",
        raw: true
      },
      funs: [#Function<47.127921642/1 in Stream.map/2>]
    ]>
  """

  @doc """
  Receives a file name, reads the file by Stream and
  returns a list of maps representing each line.
  """
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
    |> Enum.chunk_every(3)
    |> Enum.map(fn [customer, food, price] ->
      %{customer: customer, food: food, price: price}
    end)
  end
end
