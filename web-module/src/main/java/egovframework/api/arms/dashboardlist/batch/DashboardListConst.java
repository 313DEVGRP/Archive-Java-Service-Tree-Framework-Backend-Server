package egovframework.api.arms.dashboardlist.batch;

/**
 * Created by Administrator on 2021-01-09.
 */
public class DashboardListConst {

    public static final String DASHBOARD_TEMPLATE = "{\n" +
            "  \"dashboard\": {\n" +
            "    \"id\": null,\n" +
            "    \"uid\": null,\n" +
            "    \"title\": \"AUTO Generate test 2\",\n" +
            "    \"tags\": [ \"templated\" ],\n" +
            "    \"timezone\": \"browser\",\n" +
            "    \"schemaVersion\": 16,\n" +
            "    \"version\": 0,\n" +
            "\"panels\": [\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 0\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 16,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"GcCount\\\") FROM \\\"counter\\\" WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": true,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"GcCount\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"GcCount\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      }," +
            "   {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 0\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 4,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT  mean(\\\"GcTime\\\") AS \\\"mean_GcTime\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": true,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"value\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"GcTime\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:507\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:508\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 7\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 14,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"0\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"TPS\\\") FROM \\\"counter\\\" WHERE $timeFilter GROUP BY time($__interval) fill(0)\",\n" +
            "            \"rawQuery\": true,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"TPS\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"TPS\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 7\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 6,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"HeapUsed\\\") AS \\\"mean_HeapUsed\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": true,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"value\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"HeapUsed\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 14\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 12,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"HeapTotal\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"HeapTotal\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:115\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:116\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 14\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 8,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"value\\\") FROM \\\"measurement\\\" WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"ServiceCount\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"Service Monitor\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 21\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 10,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"hide\": false,\n" +
            "            \"measurement\": \"counter\",\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"PermUsed\\\") FROM \\\"counter\\\" WHERE (\\\"obj\\\" = '/9eb75e7e6e3e/www313cokr') AND $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"PermUsed\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"PermUsed\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:376\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:377\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": null,\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 21\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 2,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"groupBy\": [\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"$__interval\"\n" +
            "                ],\n" +
            "                \"type\": \"time\"\n" +
            "              },\n" +
            "              {\n" +
            "                \"params\": [\n" +
            "                  \"null\"\n" +
            "                ],\n" +
            "                \"type\": \"fill\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"orderByTime\": \"ASC\",\n" +
            "            \"policy\": \"default\",\n" +
            "            \"query\": \"SELECT mean(\\\"ElapsedTime\\\") AS \\\"mean_ElapsedTime\\\" FROM \\\"scouterCounter\\\".\\\"default\\\".\\\"counter\\\"  WHERE $timeFilter GROUP BY time($__interval) fill(null)\",\n" +
            "            \"rawQuery\": false,\n" +
            "            \"refId\": \"A\",\n" +
            "            \"resultFormat\": \"time_series\",\n" +
            "            \"select\": [\n" +
            "              [\n" +
            "                {\n" +
            "                  \"params\": [\n" +
            "                    \"value\"\n" +
            "                  ],\n" +
            "                  \"type\": \"field\"\n" +
            "                },\n" +
            "                {\n" +
            "                  \"params\": [],\n" +
            "                  \"type\": \"mean\"\n" +
            "                }\n" +
            "              ]\n" +
            "            ],\n" +
            "            \"tags\": []\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"ElapsedTime\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:394\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:395\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - TopBeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 28\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 26,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1129\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1127\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"TopBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - MetricBeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 28\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 22,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1011\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1009\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"MetricBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"columns\": [],\n" +
            "        \"datasource\": \"Elasticsearch - Filebeat\",\n" +
            "        \"fontSize\": \"100%\",\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 35\n" +
            "        },\n" +
            "        \"id\": 18,\n" +
            "        \"pageSize\": null,\n" +
            "        \"showHeader\": true,\n" +
            "        \"sort\": {\n" +
            "          \"col\": 0,\n" +
            "          \"desc\": true\n" +
            "        },\n" +
            "        \"styles\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:399\",\n" +
            "            \"alias\": \"Time\",\n" +
            "            \"align\": \"auto\",\n" +
            "            \"dateFormat\": \"YYYY-MM-DD HH:mm:ss\",\n" +
            "            \"pattern\": \"Time\",\n" +
            "            \"type\": \"date\"\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:400\",\n" +
            "            \"alias\": \"\",\n" +
            "            \"align\": \"right\",\n" +
            "            \"colorMode\": null,\n" +
            "            \"colors\": [\n" +
            "              \"rgba(245, 54, 54, 0.9)\",\n" +
            "              \"rgba(237, 129, 40, 0.89)\",\n" +
            "              \"rgba(50, 172, 45, 0.97)\"\n" +
            "            ],\n" +
            "            \"decimals\": 2,\n" +
            "            \"pattern\": \"/.*/\",\n" +
            "            \"thresholds\": [],\n" +
            "            \"type\": \"number\",\n" +
            "            \"unit\": \"short\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:709\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:707\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"meta\": {},\n" +
            "                \"settings\": {},\n" +
            "                \"type\": \"logs\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"FileBeat\",\n" +
            "        \"transform\": \"table\",\n" +
            "        \"type\": \"table\"\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - HeartBeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 35\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 20,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:881\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:879\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"HeartBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:936\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"$$hashKey\": \"object:937\",\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - PacketBeat\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 0,\n" +
            "          \"y\": 42\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 24,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1070\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1068\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"PacketBeat\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      },\n" +
            "      {\n" +
            "        \"aliasColors\": {},\n" +
            "        \"bars\": false,\n" +
            "        \"dashLength\": 10,\n" +
            "        \"dashes\": false,\n" +
            "        \"datasource\": \"Elasticsearch - APM\",\n" +
            "        \"fill\": 1,\n" +
            "        \"fillGradient\": 0,\n" +
            "        \"gridPos\": {\n" +
            "          \"h\": 7,\n" +
            "          \"w\": 12,\n" +
            "          \"x\": 12,\n" +
            "          \"y\": 42\n" +
            "        },\n" +
            "        \"hiddenSeries\": false,\n" +
            "        \"id\": 28,\n" +
            "        \"legend\": {\n" +
            "          \"avg\": false,\n" +
            "          \"current\": false,\n" +
            "          \"max\": false,\n" +
            "          \"min\": false,\n" +
            "          \"show\": true,\n" +
            "          \"total\": false,\n" +
            "          \"values\": false\n" +
            "        },\n" +
            "        \"lines\": true,\n" +
            "        \"linewidth\": 1,\n" +
            "        \"nullPointMode\": \"null\",\n" +
            "        \"options\": {\n" +
            "          \"dataLinks\": []\n" +
            "        },\n" +
            "        \"percentage\": false,\n" +
            "        \"pointradius\": 2,\n" +
            "        \"points\": false,\n" +
            "        \"renderer\": \"flot\",\n" +
            "        \"seriesOverrides\": [],\n" +
            "        \"spaceLength\": 10,\n" +
            "        \"stack\": false,\n" +
            "        \"steppedLine\": false,\n" +
            "        \"targets\": [\n" +
            "          {\n" +
            "            \"bucketAggs\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1205\",\n" +
            "                \"field\": \"@timestamp\",\n" +
            "                \"id\": \"2\",\n" +
            "                \"settings\": {\n" +
            "                  \"interval\": \"auto\",\n" +
            "                  \"min_doc_count\": 0,\n" +
            "                  \"trimEdges\": 0\n" +
            "                },\n" +
            "                \"type\": \"date_histogram\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"metrics\": [\n" +
            "              {\n" +
            "                \"$$hashKey\": \"object:1203\",\n" +
            "                \"field\": \"select field\",\n" +
            "                \"id\": \"1\",\n" +
            "                \"type\": \"count\"\n" +
            "              }\n" +
            "            ],\n" +
            "            \"refId\": \"A\",\n" +
            "            \"timeField\": \"@timestamp\"\n" +
            "          }\n" +
            "        ],\n" +
            "        \"thresholds\": [],\n" +
            "        \"timeFrom\": null,\n" +
            "        \"timeRegions\": [],\n" +
            "        \"timeShift\": null,\n" +
            "        \"title\": \"APM\",\n" +
            "        \"tooltip\": {\n" +
            "          \"shared\": true,\n" +
            "          \"sort\": 0,\n" +
            "          \"value_type\": \"individual\"\n" +
            "        },\n" +
            "        \"type\": \"graph\",\n" +
            "        \"xaxis\": {\n" +
            "          \"buckets\": null,\n" +
            "          \"mode\": \"time\",\n" +
            "          \"name\": null,\n" +
            "          \"show\": true,\n" +
            "          \"values\": []\n" +
            "        },\n" +
            "        \"yaxes\": [\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          },\n" +
            "          {\n" +
            "            \"format\": \"short\",\n" +
            "            \"label\": null,\n" +
            "            \"logBase\": 1,\n" +
            "            \"max\": null,\n" +
            "            \"min\": null,\n" +
            "            \"show\": true\n" +
            "          }\n" +
            "        ],\n" +
            "        \"yaxis\": {\n" +
            "          \"align\": false,\n" +
            "          \"alignLevel\": null\n" +
            "        }\n" +
            "      }" +
            "   ]," +
            "    \"refresh\": \"25s\"\n" +
            "  },\n" +
            "  \"folderId\": 0,\n" +
            "  \"overwrite\": true\n" +
            "}";
}
