defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    # Reads file line by line
    |> File.stream!()
    # Applies a map operation in line with parse_line() function
    |> Enum.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
