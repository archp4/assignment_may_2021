//stroge data for task 4
class TaskGraph {
  int xAxis;
  int yAxis;
  TaskGraph({
    required this.xAxis,
    required this.yAxis,
  });

  factory TaskGraph.fromJson(Map<String, dynamic> json) => TaskGraph(
        xAxis: json["x_axis"],
        yAxis: json["y_axis"],
      );

  Map<String, dynamic> toJson() => {
        "x_axis": xAxis,
        "y_axis": yAxis,
      };
}
