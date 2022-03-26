defmodule ReportsGenerator do
  alias ReportsGenerator.Parser
  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report_map -> sum_values(line, report_map) end)
  end

  defp report_acc, do: Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

end
