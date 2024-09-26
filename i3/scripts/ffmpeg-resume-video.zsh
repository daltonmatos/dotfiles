#/usr/bin/env zsh

PARTS_SIZE_SEC=3
PARTS_EVERY_SEC=300 #Cada 5min




ORIGINAL_VIDEO_FILE=${1}
VIDEO_DURATION_FLOAT=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 ${1})
VIDEO_DURATION=$(echo ${VIDEO_DURATION_FLOAT} | cut -d . -f 1)
TOTAL_PARTS=$(( ${VIDEO_DURATION} / ${PARTS_EVERY_SEC} ))

echo "Total duration: ${VIDEO_DURATION}. ${TOTAL_PARTS} partes de ${PARTS_SIZE_SEC}s"
echo "Tempo total do resumo: $((${PARTS_SIZE_SEC} * ${TOTAL_PARTS}))"


FINAL_COMAND="ffmpeg -i ${ORIGINAL_VIDEO_FILE} "

for i in $(seq ${TOTAL_PARTS}); do
  START_TIME=$(( ${i} * ${PARTS_EVERY_SEC}))
  filter_complex="${filter_complex}[0:v] trim=start=${START_TIME}:end=$((${START_TIME} + ${PARTS_SIZE_SEC})),setpts=PTS-STARTPTS[p${i}]"
  if [ ${i}  -ne ${TOTAL_PARTS} ];then
  filter_complex="${filter_complex};"
  fi
done

filter_complex="${filter_complex};$(for i in $(seq $TOTAL_PARTS);do echo -n [p${i}];done) concat=n=${TOTAL_PARTS}:v=1 [v]"

FINAL_COMAND="${FINAL_COMAND} -filter_complex '${filter_complex}' -map '[v]' -pix_fmt yuvj420p output.mp4"

echo ${FINAL_COMAND}
